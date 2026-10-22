# Emir Sener's personal website

A small Jekyll site using the al-folio theme, with an About page, a projects page,
GitHub links, and light/dark mode.

## Edit the site

- `_config.yml`: name, description, site URL, and theme settings.
- `_pages/about.md`: biography and homepage content.
- `_pages/projects.md`: project links and descriptions.
- `_data/socials.yml`: social links. Add only your own accounts.
- `_pages/404.md`: missing-page message.

To add a profile photo, place it in `assets/img/` and add a `profile` block to
`_pages/about.md`:

```yaml
profile:
  align: right
  image: profile.jpg
  image_circular: false
```

The small `_layouts/page.liquid` override renders ordinary pages without the
theme's bibliography tag, so the site does not need Jekyll Scholar.
The theme gem supplies CSS, JavaScript, and the other layouts.

## Run locally

Use Ruby 3.3 or newer and Bundler:

```sh
bundle install
bundle exec jekyll serve
```

Open http://localhost:4000. To check a production build:

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

## Deploy

The GitHub Actions workflow builds pull requests and deploys pushes to `main` or
`master` to the `gh-pages` branch. In the repository's **Settings → Pages**, use
**Deploy from a branch**, the `gh-pages` branch, and the root folder.

The site URL is https://emirseners.github.io with an empty `baseurl`.

## License

The al-folio starter's MIT license is preserved in `LICENSE`.
