
class DemoController < ApplicationController
  def test

    # response = HisAdapter::Client.new(adapter: :sdfy_his).request(:get_provinces, xml_root: "Request", wrap_field: "RequestXml")

    api = :network_test
    # params = { tradeCode: "JK1001", requestXml: "<Req>111</Req>" }

    # HisAdapter::Client.new(adapter: :jsz_http).request(api, params, xml_root: "Req", base_params: { tradeCode: "JK1001" }, wrap_field: "requestXml" )

    # params = { trade_code: "JK1001", request_xml: { Req: { ora_code: "00004", ora_auth_code: "cs0908673598" }}}

    params = {
      transaction_code: "1001",
      transaction_id: "111",
      auth_key: "eUOPTfxvGVeusXeV",
      user_id: "fdrx/FD001",
      device_id: "111",
      hospital_id: "H44011100745"
    }

    # params = {
    #   transaction_code: "JK2001",
    #   transaction_id: "111",
    #   auth_key: "eUOPTfxvGVeusXeV",
    #   user_id: "fdrx/FD001",
    #   device_id: "111",
    #   hospital_id: "H44011100745",
    #   card_num: "44150221221122",
    #   card_type: "01"
    # }
    #
    # api = :get_patient_info
    #
    # response = ::HisAdapter::Client.new(adapter: :jsz_his).request(api,
    #                                                                params,
    #                                                                xml_root: "Request",
    #                                                                wrap_field: "strXml",
    #                                                                attributes: {
    #                                                                  "xmlns" => "http://www.zoesoft.com.cn/"
    #                                                                })

    ::HisAdapter::Client.new(adapter: :new_gysy_esb).request(:get_server_time,
                                                             xml_root: "Request",
                                                             attributes: { "xmlns" => "http://ESB.Service/"
                                                             })
    p response

    render json: { result: :ok }
  end
end
