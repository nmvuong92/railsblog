# frozen_string_literal: true

json.array! @widgets, partial: 'widgets/widget', as: :widget
