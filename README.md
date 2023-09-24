# Smart Drogaria Saude™

## Requirements

* PHP 7.3 or higher
* Database (eg: MySQL, PostgreSQL, SQLite)
* Web Server (eg: Apache, Nginx, IIS)

## Framework

SmartDrogariaSaude uses [Laravel](http://laravel.com), the best existing PHP framework, as the foundation framework and [Module](https://github.com/dev-afigueredo/smart-drogaria-saude/module) package for Apps.

## Installation

* Install [Composer](https://getcomposer.org/download) and [Npm](https://nodejs.org/en/download)
* Clone the repository: `git clone https://github.com/dev-afigueredo/smart-drogaria-saude.git`
* Install dependencies: `composer install ; npm install ; npm run dev`
* Install SmartDrogariaSaude:

```bash
php artisan install --db-name="smart_drogaria_saude" --db-username="root" --db-password="" --admin-email="admin@company.com" --admin-password="123456"
```

* Create sample data (optional): `php artisan sample-data:seed`

## Contributing

Please, be very clear on your commit messages and pull requests, empty pull request messages may be rejected without reason.

When contributing code to SmartDrogariaSaude, you must follow the PSR coding standards. The golden rule is: Imitate the existing SmartDrogariaSaude code.

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

## Translation

If you'd like to contribute translations, please check out our Crowdin project.

## Changelog

Please see [Releases](../../releases) for more information what has changed recently.

## Security

Please review [our security policy](https://github.com/dev-afigueredo/smart-drogaria-saude/security/policy) on how to report security vulnerabilities.