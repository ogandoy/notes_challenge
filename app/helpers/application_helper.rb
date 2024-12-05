module ApplicationHelper
  def style_for_flash(type)
    case type.to_sym
    when :notice
      'bg-blue-100 border-l-4 border-blue-500 text-blue-700'
    when :alert
      'bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700'
    when :error
      'bg-red-100 border-l-4 border-red-500 text-red-700'
    else
      ''
    end
  end
end
