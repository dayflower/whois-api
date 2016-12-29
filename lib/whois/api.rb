require "whois/api/version"
require "whois/hash"
require "whois"
require "json"
require "time"

module Whois
  class Api
    def initialize()
      @whois = Whois::Client.new
    end

    def call(env)
      case env["PATH_INFO"]
      when "/favicon.ico"
        return [ 204, {}, [] ]
      when %r{\A/([.\w]+)\z}
        domain = $1
        begin
          record = @whois.lookup(domain).to_h
          [ :created_on, :updated_on, :expires_on ].each do |key|
            if record[key].is_a?(Time)
              record[key] = record[key].iso8601
            end
          end

          return res_json(200, record)
        rescue Whois::ServerNotFound
          return res_json(400, { :error => "bad_request" })
        rescue
          return res_json(500, { :error => "internal_server_error" })
        end
      else
        return res_json(404, { :error => "not_found" })
      end
    end

    private

    def res_json(status, content)
      body = JSON.pretty_generate(content)
      [
        status,
        {
          "Content-Type"   => "application/json",
          "Content-Length" => body.length.to_s,
        },
        [ body ]
      ]
    end

  end
end
