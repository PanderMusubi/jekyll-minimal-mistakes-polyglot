# jekyll-minimal-mistakes-polyglot

Minimal example for a [Jekyll](https://jekyllrb.com/) to get [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme with [Polyglot](https://polyglot.untra.io/) working.

## Test

Install needed software with `./install.sh`.

Generate the website with `./generate.sh` that will write to `_site`.

Start a local instance with `./serve.sh` and go to http://127.0.0.1:4000/ to view it.

## Review

Please, review this minimal example as I would like to make a PR for the Minimal Mistakes theme to support Polyglot plugin out of the box.

### Normal files

Normal files in this example are:
- `_config.yml`
  - all git files need to be excluded to prevent error with polyglot
- `Gemfile`
- `Gemfile.lock`
- `index.html`
- `about.md `
- `_data/navigation.yml`
- `.bundle`
- `vendor`
- `_site`
- `.jekyll-cache`

### Localized pages

Pages are localized in two ways in order to test both ways. These are:
- `es/index.html`
- `es/about.md`
- `ca/index.html`
- `ca/about.md`
- `index.de.html`
- `about.de.md`
- `index.nl.html`
- `about.nl.md`

All pages, including `index.html` and `about.md` have `lang` and `permalink` in their header. For pages in the default language, you can omit setting a value for `lang`. But if you decide to change the default language, omitting this can become a problem. Note that the `permalink` does not contain a language code. Also all the localized index files have a translation of the (site) description.

### Localized posts

Posts are stored as:
- `_posts/2025-11-06-test.md`
- `_posts/es/2025-11-06-test.md`
- `_posts/ca/2025-11-06-test.md`
- `_posts/de/2025-11-06-test.md`
- `_posts/nl/2025-11-06-test.md`

Mixing with `_posts/2025-11-06-test.de.md` and `_posts/2025-11-06-test.nl.md` (similar with the pages) did not work. Polyglot also advises not to mix this for posts. It might work by adding `permalink`, but makes only more mess. So fine to use only this approach.

### Localized menu

The menu is localized in:
- `_data/navigation.es.yml`
- `_data/navigation.ca.yml`
- `_data/navigation.de.yml`
- `_data/navigation.nl.yml`

Note that these cannot be stored in directories.

### Additions

Up to here, only default functionality was used. However, you will not get a properly functioning website. For that, code has been added to the following files:
1. `_layouts/default.html`
   1. `<html lang="` gets proper language code
   2. `{% include_cached masthead.html` caches per language
   3. `{% include footer.html` is no longer cached (caching on language does not work if switching languages has to result in the same page in another language) (caching is possible with lang=lang and someting with canonical_url, but I that needs needs discussion if we want that and if it is beneficial.)
2. `_data/locales.yml`
   1. contains mappings from language to locale such as `en: en_US` which are needed for `og:locale`
   2. there are no duplicates, but the user can provide a file to override these if for example `en: en_GB` is needed
3. `_includes/seo.html`
   1. `canonical_url` supports localization
   2. `property="og:locale` gets proper locale
   3. `property="og:locale:alternate` is added
3. `_includes/masthead.html` and `_data/locales.yml`
   1. links in `masthead__menu-item` use the translated title and url
4. `_includes/footer.html`
   1. `page__footer` is followed by a `float: right` which contains language switcher
   2. this is only shown when two or more languages are available

When a Polyglot plugin, setting or file is missing, the theme Minimal Mistakes works normally without errors. However, please review this and test it and try to break it. Create issues or pull requests for improvement.

When this is bullet proof, I would like to make a pull request at Minimal Mistakes. As localization is not trivial and not directly supported by themes, these additions would make a big step forward for localized websites with Minimal Mistakes.

