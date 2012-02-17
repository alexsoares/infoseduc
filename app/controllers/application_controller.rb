# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base


    include AuthenticatedSystem
    include RoleRequirementSystem
    
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1fe35b6b035a105802fded2a2460b211'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
SENHA = 'seduc@pma'
PERIODO = {'MATUTINO' => 'MATUTINO',  'VESPERTINO' => 'VESPERTINO', 'NOTURNO' => 'NOTURNO', 'TODOS' => 'TODOS'}
PERIODOT = {'MATUTINO' => 'MATUTINO',  'VESPERTINO' => 'VESPERTINO', 'NOTURNO' => 'NOTURNO','ITINERANTE' => 'ITINERANTE'}
SOLICITACAO = {'TELEFONE' => 'TELEFONE',  'E-MAIL' => 'E-MAIL', 'INTERNET' => 'INTERNET','PESSOALMENTE' => 'PESSOALMENTE', 'TERCEIROS'=> 'TERCEIROS', 'OUTROS'=>'OUTROS'}
LOCAL = {'IN-LOCU' => 'IN-LOCU',  'INFORMATICA' => 'INFORMATICA', 'OUTROS'=>'OUTROS'}
EQUIPAMENTO = {'COMPUTADOR'=> 'COMPUTADOR', 'MONITOR'=> 'MONITOR', 'SCANNER'=> 'SCANNER', 'IMPRESSORA'=> 'IMPRESSORA', 'OUTROS'=> 'OUTROS'}
ESTADO = {'FUNCIONA'=> 'FUNCIONA', 'NÃO FUNCIONA'=> 'NÃO FUNCIONA', 'TESTAR'=> 'TESTAR'}