{application,plug_crypto,
             [{optional_applications,[]},
              {applications,[kernel,stdlib,elixir,crypto]},
              {description,"Crypto-related functionality for the web"},
              {modules,['Elixir.Plug.Crypto','Elixir.Plug.Crypto.Application',
                        'Elixir.Plug.Crypto.KeyGenerator',
                        'Elixir.Plug.Crypto.MessageEncryptor',
                        'Elixir.Plug.Crypto.MessageVerifier']},
              {registered,[]},
              {vsn,"1.2.2"},
              {mod,{'Elixir.Plug.Crypto.Application',[]}}]}.
