require "revise_auth/version"
require "revise_auth/engine"
require "revise_auth/routes"

module ReviseAuth
  autoload :Authentication, "revise_auth/authentication"
  autoload :Backports, "revise_auth/backports"
  autoload :Current, "revise_auth/current"
  autoload :Model, "revise_auth/model"
  autoload :ApiModel, "revise_auth/api_model"
  autoload :RouteConstraint, "revise_auth/route_constraint"
end
