require 'color'

module LoggedItemsHelper
  def logged_item_log_button(logged_item)
    link_to(
      "Log #{ logged_item.name.titleize }",
      new_logged_item_log_path(logged_item),
      class: 'btn btn-block',
      style: "background-color: #{ Color::RGBA.to_html(logged_item.color, 0.65) };
              border-color: #{ logged_item.color };"
    )
  end

  def logged_item_logs_button(logged_item)
    link_to(
      "Logs",
      logged_item_logs_path(logged_item),
      class: 'btn btn-block',
      style: "background-color: #{ Color::RGBA.to_html(logged_item.color, 0.35) };
              border-color: #{ logged_item.color };"
    )
  end

  def logged_item_edit_button(logged_item)
    link_to(
      "Edit",
      edit_user_logged_item_path(logged_item.user, logged_item),
      class: 'btn btn-block',
      style: "background-color: #{ Color::RGBA.to_html(logged_item.color, 0.05) };
              border-color: #{ logged_item.color };"
    )
  end

  def color_swatch(color)
    content_tag(
      :div,
      nil,
      class: 'color-swatch',
      style: "background-color: #{ color };"
    )
  end

  # def logged_item_text_color(logged_item)
  #   return {
  #     white: %w(red blue green purple brown black),
  #     black:  %w(yellow orange white)
  #   }.find do |text_color, background_colors|
  #     background_colors.include?(logged_item.button_color.to_s)
  #   end.try(:first)
  # end
end
