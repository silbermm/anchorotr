package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.MailSettings;

public interface MailSettingsDao extends Dao<MailSettings> {
    MailSettings getSettings();
}
