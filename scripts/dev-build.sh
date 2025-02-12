#!/bin/bash

echo '>>>>>>>>>>  COMMON'
cd packages/common
rm -rf node_modules
npm install
cd ../../

echo '>>>>>>>>>>  CORE'
cd packages/core
rm -rf node_modules
rm -rf dist
npm install
npm run build
# rm -rf node_modules
cd ../../

echo '>>>>>>>>>>  REACT'
cd packages/react
rm -rf node_modules
rm -rf dist

pnpm install  --save-dev husky
pnpm install  --save-dev storybook
pnpm install  --save-dev @storybook/react-vite
pnpm install  --save-dev @storybook/react

pnpm install --save-dev @heroicons/react

pnpm install  --save @types/react
pnpm install --save classnames
pnpm install --save vite
pnpm install --save @vitejs/plugin-react
pnpm install --save vitest
pnpm install --save vite-plugin-dts
pnpm install --save @emotion/react
pnpm install --save @emotion/styled
pnpm install --save @testing-library/react
pnpm install --save json
pnpm install --save recharts
pnpm install --save @headlessui/react

pnpm install --save-peer @mui/material
pnpm install --save-peer @mui/styled-engine
pnpm install --save-peer tailwindcss
pnpm install --save-peer postcss
pnpm install --save-peer autoprefixer
pnpm install --save-peer @mui/x-data-grid
pnpm install --save-peer daisyui

pnpm i
pnpm build:lib
pnpm pack
# rm -rf node_modules
cd ../../
