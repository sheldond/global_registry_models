module GlobalRegistry
  class System < Base

    def self.reset_access_token(system_id)
      request(:post, nil, "systems/reset_access_token#{parametrized(system_id)}")
    end

    def self.parametrized(system_id)
      "?id=#{system_id}" if system_id
    end

  end
end