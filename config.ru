require './config/environment'

use Rack::MethodOverride
use PostsController
use SessionsController
use UsersController

run ApplicationController