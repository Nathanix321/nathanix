{ inputs, den, ... }:
{
  _module.args.__findFile = den.lib.__findFile;
  imports = [
    (inputs.den.namespace "nathanix" true)
    (inputs.den.namespace "nathaniel" false)
    (inputs.den.namespace "my" false)
  ];
}