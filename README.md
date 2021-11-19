# HisAdapter
Short description and motivation.

## Usage

金沙洲: 
```ruby
api = :pending_pay
params = {
  ora_code: "00004" ,
  ora_auth_code: "cs0908673598",
  transaction_code: "JK3008",
  disp_or_resi: 0,
  id_card_no: "440102195106192366",
  clinic_card: "0000006236"
}

```

广三旧院区 his: 
```ruby
api = :get_registerable_departments
params = {date: "2021-11-16", hospital_id: "", dept_id: ""}
HisAdapter::Client.new(adapter: :gysy_his).request(api, 
                                                   params, 
                                                   xml_root: "req", 
                                                   wrap_field: "p_strXml")
```

广三旧院区 lis: 
```ruby
api = :get_patients_info
params = { patient_hospital_no: "4401000036309570" }

HisAdapter::Client.new(adapter: :gysy_lis).request(api,
                                              params,
                                              xml_root: "")
```

广三旧院区 esb:
```ruby
api = :get_endoscpy_report_list 
params = {
  card_no: "0000440726",
  card_type: "0",
  begin_date: "2014-01-01",
  end_date: "2014-08-01"
}

HisAdapter::Client.new(adapter: :gysy_esb).request(api, 
                                                   params, 
                                                   xml_root: "req", 
                                                   attributes: { "xmlns" => "http://ESB.Service/" })
```

顺德妇幼
```ruby
# 有参数 api 调用方式
api_without_params = :get_provinces 

HisAdapter::Client.new(adapter: :sdfy_his).request(api_without_params, 
                                                   xml_root: "Request",
                                                   wrap_field: "RequestXml")

# 无参 api 调用方式
api_with_params = :get_cities
params = { 
  province_code: "44"
}

HisAdapter::Client.new(adapter: :sdfy_his).request(api_with_params,
                                                   params,
                                                   xml_root: "Request",
                                                   wrap_field: "RequestXml")
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'his_adapter'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install his_adapter
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
