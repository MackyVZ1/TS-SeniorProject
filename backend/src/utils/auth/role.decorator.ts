import { SetMetadata } from '@nestjs/common';

export const ROLES_KEY = 'roles';

// Role constants
export const ROLES = {
  ADMIN: 'admin',
  APPOINTMENT: 'appointment',
  PAYMENT: 'payment',
  MEDICALRECORD: 'medicalrecord',
  TEACHER: 'teacher',
  BACHELOR: 'bachelor',
  DRUG: 'drug',
  GENERAL: 'general',
  MASTER: 'master',
  REQUIREMENTDIAG: 'requirementdiag',
  HEADASSISTANTDENTIST: 'headassistantdentist',
  ASSISTANTDENTIST: 'assistantdentist',
} as const;

export type Role = (typeof ROLES)[keyof typeof ROLES];

// Role ID to Role Name mapping
export const ROLE_ID_TO_NAME: Record<number, Role> = {
  1: ROLES.ADMIN,
  2: ROLES.APPOINTMENT,
  3: ROLES.PAYMENT,
  4: ROLES.MEDICALRECORD,
  5: ROLES.TEACHER,
  6: ROLES.BACHELOR,
  7: ROLES.DRUG,
  8: ROLES.GENERAL,
  9: ROLES.MASTER,
  10: ROLES.REQUIREMENTDIAG,
  11: ROLES.HEADASSISTANTDENTIST,
  12: ROLES.ASSISTANTDENTIST,
};

// Role Name to Role ID mapping
export const ROLE_NAME_TO_ID: Record<Role, number> = {
  [ROLES.ADMIN]: 1,
  [ROLES.APPOINTMENT]: 2,
  [ROLES.PAYMENT]: 3,
  [ROLES.MEDICALRECORD]: 4,
  [ROLES.TEACHER]: 5,
  [ROLES.BACHELOR]: 6,
  [ROLES.DRUG]: 7,
  [ROLES.GENERAL]: 8,
  [ROLES.MASTER]: 9,
  [ROLES.REQUIREMENTDIAG]: 10,
  [ROLES.HEADASSISTANTDENTIST]: 11,
  [ROLES.ASSISTANTDENTIST]: 12,
};

export const Roles = (...roles: Role[]) => SetMetadata(ROLES_KEY, roles);
