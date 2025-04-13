defmodule Sneakers23Web.WallabyHelpers do
  use ExUnit.CaseTemplate
  import Wallaby.Query, only: [css: 2]

  def assert_has_within_timeout(session, selector, opts \\ []) do
    wait_time = Keyword.get(opts, :timeout, 1000)
    :timer.sleep(wait_time)
    assert Wallaby.Browser.has?(session, css(selector, opts))
    session
  end
end
