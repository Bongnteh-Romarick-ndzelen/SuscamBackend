from django.db import models
import uuid

# Create your models here.

class TermsModel(models.Model):
    name = models.CharField(max_length=250)
    term_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    text = models.TextField()
    
    def __str__(self):
        return self.name