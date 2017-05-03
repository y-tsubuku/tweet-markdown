module ApplicationHelper
  def msg_type_into_priority(msg_type)
    case msg_type
      when 'notice'
        'success'
      when 'alert'
        'warning'
      else
        msg_type
    end
  end
end
