from django.contrib import admin
from django.contrib.auth.models import User
from django import forms

from .models import Farm
from .models import Site, SiteDescription
from .models import Crop
from .models import Reading
from .models import Report
from .models import Calibration
from .models import ReadingType
from .models import Probe
from .models import Season
from .models import ETReading
from .models import KCReading
from .models import Diviner
from .models import ProbeDiviner
from .models import UserFullName

class ProbeDivinerAdmin(admin.ModelAdmin):
    list_display = ('probe', 'diviner')

class DivinerAdmin(admin.ModelAdmin):
    list_display = ('diviner_number', 'site')

class KCReadingAdmin(admin.ModelAdmin):
    list_display = ('crop', 'period_from', 'period_to', 'kc')

class ETReadingAdmin(admin.ModelAdmin):
    list_display = ('date', 'state', 'daily')

class ReadingAdmin(admin.ModelAdmin):
    list_display = ('site', 'type', 'date', 'serial_number', 'depth1')

class ReadingTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'comment', 'formula')

class SeasonAdmin(admin.ModelAdmin):
    list_display = ('name', 'period_from', 'period_to', 'comment')

class FarmAdmin(admin.ModelAdmin):
    list_display = ('name',)

class CalibrationAdmin(admin.ModelAdmin):
    list_display = ('serial_number', 'soil_type', 'period_from', 'period_to', 'slope', 'intercept')

class FarmAdmin(admin.ModelAdmin):
    list_display = ('name',)

class SiteAdmin(admin.ModelAdmin):
    list_display = ('site_number', 'name', 'farm', 'technician')
    fieldsets = [
        ('Main',        {'fields': ['site_number', 'farm', 'technician', 'name', 'variety','crop','season_start', 'bud_break', 'cd2', 'cd3', 'cd4', 'cd5', 'cd6', 'season_end','created_date', 'created_by']}),
        ('Irrigation',  {'fields': ['irrigation_method', 'irrigation_area', 'irrigation_time', 'irrigation_delivered_volume','irrigation_position','irrigation_yield','irrigation_allocation_volume'],
            'classes': ['collapse']}),
        ('Root Zones',  {'fields': ['rz1_top','rz1_bottom','rz2_top','rz2_bottom','rz3_top','rz3_bottom'], 'classes': ['collapse']}),
        ('Depths',  {'fields': [('depth1', 'depth_he1'),('depth2', 'depth_he2'),('depth3', 'depth_he3'),('depth4', 'depth_he4'),
                                ('depth5', 'depth_he5'),('depth6', 'depth_he6'),('depth7', 'depth_he7'),('depth8', 'depth_he8'),
                                ('depth9', 'depth_he9'),('depth10', 'depth_he10')],'classes': ['collapse']}),
        ('Schedule',    {'fields': ['upper_limit', 'lower_limit', 'emitter_rate', 'row_spacing', 'emitter_spacing', 'plant_spacing', 'wetted_width', 'delivery_time', 'area'],
            'classes': ['collapse']}),
    ]
    radio_fields = {'irrigation_method': admin.HORIZONTAL}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'technician':
            kwargs["queryset"] = UserFullName.objects.filter(groups__name='Technician')
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    #.values('first_name','last_name')

class CropAdmin(admin.ModelAdmin):
    list_display = ['name']
    fieldsets = [
        ('Main',        {'fields': ['name', 'report','dwu_formaula', 'created_date', 'created_by']}),
        ('Dates',       {'fields': ['season_start',('critical_label1','critical_date1'), ('critical_label2','critical_date2'), ('critical_label3','critical_date3'),
                                    ('critical_label4','critical_date4'), ('critical_label5','critical_date5'), ('critical_label6','critical_date6'),'season_end'],'classes': ['collapse']}),
        ('Irrigations', {'fields': ['irrigation_method', 'irrigation_area', 'irrigation_time', 'irrigation_delivered_volume','irrigation_position',
                                    'irrigation_upper', 'irrigation_lower', 'irrigation_crop_factor', 'irrigation_deliver_factor', 'irrigation_yield',
                                    'irrigation_drip_days', 'irrigation_row_space', 'irrigation_emit_space', 'irrigation_plant_space', 'irrigation_wet_width'],'classes': ['collapse']}),
    ]
    radio_fields = {'irrigation_method': admin.HORIZONTAL}

class ProbeAdmin(admin.ModelAdmin):
    list_display = ['id', 'serial_number', 'comment']

admin.site.register(Site, SiteAdmin)
admin.site.register(Farm, FarmAdmin)
admin.site.register(Crop, CropAdmin)
admin.site.register(Reading, ReadingAdmin)
admin.site.register(Report)
admin.site.register(Calibration, CalibrationAdmin)
admin.site.register(ReadingType, ReadingTypeAdmin)
admin.site.register(Probe, ProbeAdmin)
admin.site.register(Season, SeasonAdmin)
admin.site.register(ETReading, ETReadingAdmin)
admin.site.register(KCReading, KCReadingAdmin)
admin.site.register(Diviner, DivinerAdmin)
admin.site.register(ProbeDiviner, ProbeDivinerAdmin)
