$(document).on("ready page:load", ->

  skills = $('.skills')
  disabled = skills.hasClass('skills-disabled')

  skills.tagsInput(
    width: 'auto'
    autocomplete_url: '/skills/search'
    defaultText: 'добавить'
    interactive: !disabled
  )

  if disabled
    $('.tagsinput').find('a').remove();
)