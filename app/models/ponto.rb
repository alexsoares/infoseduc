class Ponto < ActiveRecord::Base
  belongs_to :estagiario
  has_many :justificativas
  before_update :calcula_total_trabalhado
  before_save :ano_letivo
  #named_scope :mes, lambda {|month| {:select => "month(created_at) as 'mes', created_at", :conditions => ["month(created) = ?",month],:group => "month(created_at)"}}
  named_scope :mes, :select => "mes, created_at", :group => "mes"
  named_scope :ano, :select => "year(created_at) as 'ano'", :group => "year(created_at)"


  before_create :verifica_mes

  def verifica_mes
    if self.entrada.present?
      self.mes = self.entrada.month
    end
  end
  
  def calcula_total_trabalhado
    self.total_trabalhado = ((self.saida - self.entrada) /60)
  end

  def self.convert_to_hour(minutos)
    if minutos > 60
      horas = minutos / 60
      if (minutos % 60) < 10
        horas = "#{horas}h:0#{minutos % 60} minutos"
      else
        horas = "#{horas}h:#{minutos % 60} minutos"
      end
    else
      "#{minutos} minutos"
    end
  end


  def ano_letivo
    self.ano = Time.current.year
  end



  def self.define_month(date)
    t = Time.current.month
    u = date.month
    if Time.current.month >= date.month
        data = date.strftime("%Y-%m-%d").to_date
        if date.month == 1
          inicio = "#{date.year}-12-22".to_date
        else
          inicio = "#{date.year}-#{(date.month.to_i) -1}-22".to_date
        end
        fim = "#{date.year}-#{date.month.to_i }-21".to_date
      if data.between?(inicio,fim)
        date.month
      else
        date.month + 1
      end
    else
      if date.month == 1
        12
      else
        date.month - 1
      end
    end
  end



end
