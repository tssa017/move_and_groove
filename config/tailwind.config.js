const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
    content: [
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.{erb,haml,html,slim}',
        './pages/**/*.{erb,html,js}',
        './components/**/*.{erb,html,js}',
        './../app/views/activity_logs/index.html.erb',
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/container-queries'),
    ],
    purge: {
        content: ['./../app/views/**/*.html.erb'],
        safelist: ['bg-green-500'],
    },
};
