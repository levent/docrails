module EnvHelpers
  private

  def with_rails_env(env)
    switch_env 'RAILS_ENV', env do
      switch_env 'RACK_ENV', nil do
        yield
      end
    end
  end

  def with_rack_env(env)
    switch_env 'RACK_ENV', env do
      switch_env 'RAILS_ENV', nil do
        yield
      end
    end
  end

  def switch_env(key, value)
    old, ENV[key] = ENV[key], value
    yield
  ensure
    ENV[key] = old
  end
end
