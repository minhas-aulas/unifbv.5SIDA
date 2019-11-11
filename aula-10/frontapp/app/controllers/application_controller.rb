class ApplicationController < ActionController::Base
    def rest_api(uri, method, data={})
        url = "http://127.0.0.1:4000/#{uri}"
        resp = RestClient::Request.execute(
            method: method, url: url, headers: {
                params: data
            })
        return JSON.parse(resp) rescue nil
    end
end
