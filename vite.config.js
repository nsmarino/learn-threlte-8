import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	optimizeDeps: {
		esbuildOptions: {
		  target: 'esnext'
		}
	  },
	esbuild: {
		supported: {
			'top-level-await': true //browsers can handle top-level-await features
		},
	},
	plugins: [sveltekit()]
});
