package com.gx.soft.weeklywork.persistence.manager;

import com.gx.core.hibernate.HibernateEntityDao;
import com.gx.soft.weeklywork.persistence.domain.FileRecord;
import org.springframework.stereotype.Service;

@Service
public class FileRecordManager extends HibernateEntityDao<FileRecord> {
}
