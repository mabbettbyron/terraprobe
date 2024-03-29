from django.core import management
from django.core.management.base import BaseCommand
from django.utils import timezone

# Get an instance of a logger
import logging
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Process all processes that derive readings values'

    def handle(self, *args, **kwargs):
        logger.info('Running processall_readings.....')

        management.call_command('request_to_hortplus_v2')
        management.call_command('processrootzones')
        management.call_command('processmeter')
        management.call_command('processdailywateruse')
        management.call_command('processrainirrigation')

        logger.info('Finished processall_readings.....')
