class Justificativa < ActiveRecord::Base
  belongs_to :ponto
  belongs_to :estagiario
  #validate :verifica_datas
  #validates_presence_of :cumpriu_horario, :if => :nao_bateu_ponto?
  #validates_presence_of :horario, :if => :cumpriu?
  attr_accessor :hour

 
  after_save :cria_ponto, :if => :nao_bateu_ponto?
  after_save :forgot_hit_out, :if => :just_out
  after_update :update_ponto, :if => !(:just_out)
  before_save :qtde_horas, :if => :just_out
  
  def verifica_datas
    if self.saida.to_date < self.entrada.to_date
      errors.add(:saida, "Saida horário de saida deve ser maior que o de entrada")
      true
    end
  end
  def cumpriu?
    self.cumpriu_horario.present?
  end

#=======Somente para Justificação completa
  def nao_bateu_ponto?
    justificativa_total
    !(self.ponto_id.present?)
  end

  def sem_ponto
    if self.cumpriu_horario.present?
          self.qtd_hrs = 300
    else
          self.qtd_hrs = 0
    end
  end
  
  def justificativa_total
    if self.saida.present? && self.entrada.present?
      sem_ponto
    end
  end

  #=========================================

  def update_ponto
    data1 = self.dia.to_datetime + 23.hour + 59.minutes
    p = Ponto.find_by_estagiario_id(self.estagiario_id, :conditions => ["entrada between ? and ?", self.dia.to_datetime,data1])
    if self.cumpriu_horario
      saida = horario
      p.total_trabalhado = ((saida).to_i - (p.entrada).to_i) / 60
      p.saida = corrige_hora_saida
      self.qtd_hrs = p.total_trabalhado
      p.updated_at = Time.current
      p.save!
      
    end
  end

  def qtde_horas
    data1 = self.dia.strftime("%Y-%m-%d").to_date + 23.hour + 59.minutes
    p = Ponto.find_by_estagiario_id(self.estagiario_id, :conditions => ["created_at between ? and ?", self.dia.to_datetime,data1])
    if p
      self.hora_saida = corrige_hora_saida
      saida = horario
      entrada = (p.entrada).to_time
      self.qtd_hrs = (saida.to_i - entrada.to_i) / 60
      p.saida = self.hora_saida
      p.total_trabalhado = self.qtd_hrs
      p.mes = self.dia.month
      p.ano = self.dia.year
      p.updated_at = Time.current
      p.save
    end
  
  end


  def cria_ponto
    ponto = Ponto.new
    ponto.estagiario_id = self.estagiario_id
    type = Estagiario.type(self.estagiario_id)
    if type == "MATUTINO"
      ponto.entrada = ("#{self.dia + 10.hour}").to_time
      ponto.saida = ("#{self.dia + 15.hour}").to_time
      ponto.created_at = ("#{self.dia + 10.hour}").to_time
      ponto.updated_at = ("#{self.dia + 15.hour}").to_time
    else
      if type == "VESPERTINO"
      ponto.created_at = ("#{self.dia + 15.hour}").to_time
      ponto.updated_at = ("#{self.dia + 20.hour}").to_time

      end
    end
    ponto.total_trabalhado = justificativa_total
    ponto.mes = self.dia.month
    ponto.save
  end

  def forgot_hit_out
    self.cumpriu_horario = 1    
  end


  def horario
    ("#{self.dia + ((mount_hour[0]).to_i).hour + (mount_hour[1]).to_i.minutes}").to_time
  end

  def just_out
   self.ponto_id.present?
  end

  def mount_hour
    both = self.hour.split(":")

  end

  def corrige_hora_saida
    self.hora_saida = horario + 3.hours
  end

end
