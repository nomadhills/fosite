// Copyright © 2024 Ory Corp
// SPDX-License-Identifier: Apache-2.0

package compose

import (
	"github.com/nomadhills/fosite"
	"github.com/nomadhills/fosite/handler/par"
)

// PushedAuthorizeHandlerFactory creates the basic PAR handler
func PushedAuthorizeHandlerFactory(config fosite.Configurator, storage interface{}, strategy interface{}) interface{} {
	return &par.PushedAuthorizeHandler{
		Storage: storage,
		Config:  config,
	}
}
