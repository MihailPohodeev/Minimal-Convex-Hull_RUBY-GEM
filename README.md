# MinimalConvexHull

Тема гема: Библиотека для построения выпуклых оболочек. В данном проекте реализованы алгоритмы Джарвиса и Грэхема. Алгоритм Джарвиса (или алгоритм оболочки) используется для нахождения выпуклой оболочки множества точек в двумерном пространстве. Он работает путем построения выпуклой оболочки пошагово, выбирая следующую точку, которая образует выпуклую оболочку с предыдущими точками.

Алгоритм Грэхема также используется для нахождения выпуклой оболочки множества точек в двумерном пространстве. Он сначала находит самую левую нижнюю точку и использует её в качестве отправной точки. Затем он сортирует остальные точки по углу, который они образуют с отправной точкой, и затем проходит по отсортированным точкам, строя выпуклую оболочку.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add minimal_convex_hull

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install minimal_convex_hull

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run bin/setup to install dependencies. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and the created tag, and push the .gem file to [rubygems.org](https://rubygems.org).

## Разработчики

Походеев Михаил
Пинчук Константин
