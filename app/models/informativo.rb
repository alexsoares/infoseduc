class Informativo < ActiveRecord::Base
  def self.informativos_corrente(hide_time)
    with_scope :find => {:conditions => ["starts_at <= ? AND ends_at >= ?",Time.current,Time.current]} do
      if hide_time.nil?
        find(:all)
      else
        t = find(:all,:conditions => ["updated_at > ?", hide_time])
        find(:all,:conditions => ["updated_at > ?", hide_time])
      end
    end
  end
end
