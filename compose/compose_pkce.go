// Copyright © 2024 Ory Corp
// SPDX-License-Identifier: Apache-2.0

package compose

import (
	"github.com/nomadhills/fosite"
	"github.com/nomadhills/fosite/handler/oauth2"
	"github.com/nomadhills/fosite/handler/pkce"
)

// OAuth2PKCEFactory creates a PKCE handler.
func OAuth2PKCEFactory(config fosite.Configurator, storage interface{}, strategy interface{}) interface{} {
	return &pkce.Handler{
		AuthorizeCodeStrategy: strategy.(oauth2.AuthorizeCodeStrategy),
		Storage:               storage.(pkce.PKCERequestStorage),
		Config:                config,
	}
}
