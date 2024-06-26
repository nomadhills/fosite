#!/bin/bash

mockgen -package internal -destination internal/hash.go github.com/nomadhills/fosite Hasher
mockgen -package internal -destination internal/storage.go github.com/nomadhills/fosite Storage
mockgen -package internal -destination internal/transactional.go github.com/nomadhills/fosite/storage Transactional
mockgen -package internal -destination internal/oauth2_storage.go github.com/nomadhills/fosite/handler/oauth2 CoreStorage
mockgen -package internal -destination internal/oauth2_strategy.go github.com/nomadhills/fosite/handler/oauth2 CoreStrategy
mockgen -package internal -destination internal/authorize_code_storage.go github.com/nomadhills/fosite/handler/oauth2 AuthorizeCodeStorage
mockgen -package internal -destination internal/oauth2_auth_jwt_storage.go github.com/nomadhills/fosite/handler/rfc7523 RFC7523KeyStorage
mockgen -package internal -destination internal/access_token_storage.go github.com/nomadhills/fosite/handler/oauth2 AccessTokenStorage
mockgen -package internal -destination internal/refresh_token_strategy.go github.com/nomadhills/fosite/handler/oauth2 RefreshTokenStorage
mockgen -package internal -destination internal/oauth2_client_storage.go github.com/nomadhills/fosite/handler/oauth2 ClientCredentialsGrantStorage
mockgen -package internal -destination internal/oauth2_owner_storage.go github.com/nomadhills/fosite/handler/oauth2 ResourceOwnerPasswordCredentialsGrantStorage
mockgen -package internal -destination internal/oauth2_revoke_storage.go github.com/nomadhills/fosite/handler/oauth2 TokenRevocationStorage
mockgen -package internal -destination internal/openid_id_token_storage.go github.com/nomadhills/fosite/handler/openid OpenIDConnectRequestStorage
mockgen -package internal -destination internal/access_token_strategy.go github.com/nomadhills/fosite/handler/oauth2 AccessTokenStrategy
mockgen -package internal -destination internal/refresh_token_strategy.go github.com/nomadhills/fosite/handler/oauth2 RefreshTokenStrategy
mockgen -package internal -destination internal/authorize_code_strategy.go github.com/nomadhills/fosite/handler/oauth2 AuthorizeCodeStrategy
mockgen -package internal -destination internal/id_token_strategy.go github.com/nomadhills/fosite/handler/openid OpenIDConnectTokenStrategy
mockgen -package internal -destination internal/pkce_storage_strategy.go github.com/nomadhills/fosite/handler/pkce PKCERequestStorage
mockgen -package internal -destination internal/authorize_handler.go github.com/nomadhills/fosite AuthorizeEndpointHandler
mockgen -package internal -destination internal/revoke_handler.go github.com/nomadhills/fosite RevocationHandler
mockgen -package internal -destination internal/token_handler.go github.com/nomadhills/fosite TokenEndpointHandler
mockgen -package internal -destination internal/introspector.go github.com/nomadhills/fosite TokenIntrospector
mockgen -package internal -destination internal/client.go github.com/nomadhills/fosite Client
mockgen -package internal -destination internal/request.go github.com/nomadhills/fosite Requester
mockgen -package internal -destination internal/access_request.go github.com/nomadhills/fosite AccessRequester
mockgen -package internal -destination internal/access_response.go github.com/nomadhills/fosite AccessResponder
mockgen -package internal -destination internal/authorize_request.go github.com/nomadhills/fosite AuthorizeRequester
mockgen -package internal -destination internal/authorize_response.go github.com/nomadhills/fosite AuthorizeResponder

goimports -w internal/