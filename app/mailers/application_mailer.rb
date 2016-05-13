class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def receivers(name)
    config_class = "FormConfigs::#{name.classify}".constantize
    to = config_class.first.try(&:emails) || config_class.default_emails
    to
  end

  def new_order_request(r)
    @order_request = r

    mail(
        template_name: "order_request",
        to: receivers("order_request"),
        from: "WineGarden <#{ActionMailer::Base.smtp_settings[:user_name]}>",
        subject: "New order request"
    )
  end


end