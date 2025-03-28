{application,plug_cowboy,
             [{optional_applications,[]},
              {applications,[kernel,stdlib,elixir,logger,plug,cowboy,
                             cowboy_telemetry]},
              {description,"A Plug adapter for Cowboy"},
              {modules,['Elixir.Plug.Cowboy','Elixir.Plug.Cowboy.Conn',
                        'Elixir.Plug.Cowboy.Drainer',
                        'Elixir.Plug.Cowboy.Handler',
                        'Elixir.Plug.Cowboy.Translator']},
              {registered,[]},
              {vsn,"2.5.2"},
              {mod,{'Elixir.Plug.Cowboy',[]}}]}.
