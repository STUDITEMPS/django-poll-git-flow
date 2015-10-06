# coding: utf-8
# flake8: noqa

__author__ = 'trungphanan'

import importlib
from behave import given, when, then

from model_mommy import mommy

from polls.models import Choice


def value_parser(value):
    if value == "''":
        value = ''
    elif value == 'None':
        value = None
    elif value == 'False':
        value = False
    elif value == 'True':
        value = True

    return value


@given('Choice id "{id}"')
def step_impl(context, id):
    context.choice = Choice.objects.get(pk=id)
    context.old_votes = context.choice.votes 
    

@when('vote for choice')
def step_impl(context):
	context.choice.votes += 1
	context.choice.save()


@then('new vote is greater then old vote')
def step_impl(context):
	new_votes = Choice.objects.get(pk=context.choice.pk).votes
	assert new_votes > context.old_votes, "expects increased votes of old value %s" \
        % (context.old_votes)


