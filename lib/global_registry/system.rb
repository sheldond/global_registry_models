
module GlobalRegistry
  class System

    def self.reset_access_token(system_id, params)
      request(:post, params, "/systems/reset_access_token#{parametrized(system_id)}")
    end

    def self.parametrized(system_id)
      "?id=#{system_id}" if system_id
    end

  end
end