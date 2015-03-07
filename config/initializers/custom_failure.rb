class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end
  def i18n_message(default = nil)
      # message = warden_message || default || :unauthenticated

      # if message.is_a?(Symbol)
        # options = {}
        # options[:resource_name] = scope
        # options[:scope] = "devise.info"
        # options[:default] = [message]
        # auth_keys = scope_class.authentication_keys
        # keys = auth_keys.respond_to?(:keys) ? auth_keys.keys : auth_keys
        # options[:authentication_keys] = keys.join(I18n.translate(:"support.array.words_connector"))
        # options = i18n_options(options)

        # I18n.t(:"#{scope}.#{message}", options)
        message = "<b>Sorry, it looks like you aren't enrolled in a course. Your Professor might not have uploaded the roster yet.</b><br> If this error persists, check with your instructor that your UCInetid is correct on your roster.".html_safe
      # else
      #   message.to_s
      # end
    end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end