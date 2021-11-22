
class DemoController < ApplicationController
  def test

    # response = HisAdapter::Client.new(adapter: :sdfy_his).request(:get_provinces, xml_root: "Request", wrap_field: "RequestXml")

    api = :network_test
    params = { tradeCode: "JK1001", requestXml: "<Req>111</Req>" }
    HisAdapter::Client.new(adapter: :jsz_http).request(api, params, wrap_field: "")

    # params = { Req: { trade_code: "JK1001", request_xml: { Req: { trade_code: "JK1001", ora_code: "00004", ora_auth_code: "cs0908673598" }}, transaction_code: "JK1001" }}


    # response = HisAdapter::Client.new(adapter: :jsz_his).request(api,
    #                                                              params,
    #                                                              xml_root: "",
    #                                                              attributes: {
    #                                                                "xmlns" => "http://www.zoesoft.com.cn/"
    #                                                              })

    # p response

    render json: { result: :ok }
  end
end
