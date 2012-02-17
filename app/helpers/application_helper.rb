# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def informativos_corrente
   @current_announcements ||= Informativo.informativos_corrente(session[:announcement_hide_time])
  end

  def translate_month_tag(month, options={})
    if month == 1
      "Janeiro"
    else
      if month == 2
        "Fevereiro"
      else
        if month == 3
          "Março"
        else
          if month == 4
            "Abril"
          else
            if month == 5
              "Maio"
            else
              if month == 6
                "Junho"
              else
                if month == 7
                  "Julho"
                else
                  if month == 8
                    "Agosto"
                  else
                    if month == 9
                      "Setembro"
                    else
                      if month == 10
                        "Outubro"
                      else
                        if month == 11
                          "Novembro"
                        else
                          if month == 12
                            "Dezembro"
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
   end
end
