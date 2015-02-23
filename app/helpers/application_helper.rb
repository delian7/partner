module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
    <button type="button" class="close" data-dismiss="alert">&#215;</button>
    #{messages}
    </div>
    HTML
    html.html_safe
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Submit form through link
  # def link_to_submit(text)
  #   link_to_function text, "$(this).closest('form').submit()"
  # end
  
  # def link_to_function(name, *args, &block)
  #   html_options = args.extract_options!.symbolize_keys

  #   function = block_given? ? update_page(&block) : args[0] || ''
  #   onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
  #   href = html_options[:href] || '#'

  #   content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  # end



end
