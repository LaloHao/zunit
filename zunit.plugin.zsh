#!/usr/bin/env zsh

local self=$funcsourcetrace[1]
local dir=$(dirname $self)

pushd $dir > /dev/null

if [ ! -f "zunit" ]; then
  source build.zsh
fi

if [ ! -f "init.zsh" ]; then
  echo "#!/usr/bin/env zsh\nalias zunit='$dir/zunit'" > init.zsh
fi

chmod +x zunit
chmod +x init.zsh

popd > /dev/null
