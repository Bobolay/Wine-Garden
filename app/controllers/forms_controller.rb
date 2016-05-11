class FormsController < ApplicationController
  def order_request
    order_request_params = params[:order_request] || {}
    order_request_params[:date_time] = DateTime.parse(order_request_params["date"] + " " + order_request_params["time"])
    order_request = OrderRequest.new(order_request_params)
    order_request.referer = request.referer
    order_request.session_id = session.id
    order_request.save



    ApplicationMailer.new_order_request(order_request).deliver_now

    data = {}
    render json: data, status: 201
  end
end

Date.new