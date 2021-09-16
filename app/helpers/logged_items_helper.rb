require 'color'

module LoggedItemsHelper
  def logged_item_button(logged_item)
    button_color = logged_item.button_color

    link_to(
      logged_item.name,
      new_user_logged_item_log_path(current_user, logged_item),
      class: 'btn btn-block mb-8',
      style: "background-color: #{ Color::RGBA.to_html(button_color, 0.25) };
              border-color: #{ button_color };"
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
