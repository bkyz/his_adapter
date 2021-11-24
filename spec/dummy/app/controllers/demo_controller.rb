
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
      auth_key: "tTEHlaEHZYaouVNs",
      user_id: "倍康微信/Z997",
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

    # resp = ::HisAdapter::Client.new(adapter: :new_gysy_esb).request(:get_registerable_departments,
    #                                                                 {
    #                                                                   branch_id: "02",
    #                                                                 },
    #                                                                 xml_root: "Request",
    #                                                                 wrap_field: "xmlMessage",
    #                                                                 attributes: { "xmlns" => "http://ESB.Service/"  })

    resp = ::HisAdapter::Client.new(adapter: :jsz_his).request(:get_registerable_departments,
                                                        params,
                                                        attributes: {
                                                          "xmlns" => "http://www.zoesoft.com.cn/"
                                                        })
    # resp = ::HisAdapter::Client.new(adapter: :new_gysy_esb).request(:get_server_time,
    #                                                          attributes: { "xmlns" => "http://ESB.Service/" })
    # render json: resp.data
    render json: resp.data
  end
end
