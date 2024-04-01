// Copyright © 2024 Ory Corp
// SPDX-License-Identifier: Apache-2.0

package compose

import (
	"context"

	"github.com/nomadhills/fosite"
	"github.com/nomadhills/fosite/handler/oauth2"
	"github.com/nomadhills/fosite/handler/openid"
	"github.com/nomadhills/fosite/token/hmac"
	"github.com/nomadhills/fosite/token/jwt"
)

type CommonStrategy struct {
	oauth2.CoreStrategy
	openid.OpenIDConnectTokenStrategy
	jwt.Signer
}

type HMACSHAStrategyConfigurator interface {
	fosite.AccessTokenLifespanProvider
	fosite.RefreshTokenLifespanProvider
	fosite.AuthorizeCodeLifespanProvider
	fosite.TokenEntropyProvider
	fosite.GlobalSecretProvider
	fosite.RotatedGlobalSecretsProvider
	fosite.HMACHashingProvider
}

func NewOAuth2HMACStrategy(config HMACSHAStrategyConfigurator) *oauth2.HMACSHAStrategy {
	return &oauth2.HMACSHAStrategy{
		Enigma: &hmac.HMACStrategy{Config: config},
		Config: config,
	}
}

func NewOAuth2JWTStrategy(keyGetter func(context.Context) (interface{}, error), strategy *oauth2.HMACSHAStrategy, config fosite.Configurator) *oauth2.DefaultJWTStrategy {
	return &oauth2.DefaultJWTStrategy{
		Signer:          &jwt.DefaultSigner{GetPrivateKey: keyGetter},
		HMACSHAStrategy: strategy,
		Config:          config,
	}
}

func NewOpenIDConnectStrategy(keyGetter func(context.Context) (interface{}, error), config fosite.Configurator) *openid.DefaultStrategy {
	return &openid.DefaultStrategy{
		Signer: &jwt.DefaultSigner{GetPrivateKey: keyGetter},
		Config: config,
	}
}
