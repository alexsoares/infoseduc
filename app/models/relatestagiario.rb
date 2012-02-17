class Relatestagiario < ActiveRecord::Base
  belongs_to :estagiario
  belongs_to :unidade
  attr_accessor :password, :segunda,:terca,:quarta,:quinta, :sexta
  validates_presence_of :estagiario_id, :message => ' - SELECIONAR ESTAGIARIO  - '


  before_save :concatenacao, :caixa_alta
  

  def concatenacao
    self.ocorrencia = "#{self.segunda} %% #{self.terca} %% #{self.quarta} %% #{self.quinta} %% #{self.sexta} ;"
  end

  def caixa_alta
    self.providencia.upcase!
    self.ocorrencia.upcase!
    self.responsavel.upcase!
    self.periodo.upcase!    
  end

  def separacao
    ocorrencia = []
    ocorrencia = self.ocorrencia.split(" %% ")
    self.segunda = ocorrencia[0]
    self.terca = ocorrencia[1]
    self.quarta = ocorrencia[2]
    self.quinta = ocorrencia[3]
    self.sexta = ocorrencia[4]
  end

 end