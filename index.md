---
layout: dashboard
title: pages.home.title
---

### Type Definition

#### Trait Type Definition

##### liteql.domain_type (Trait Type)

```json
{
  "trait": true,
  "fields": [
    {
      "name": "id",
      "type": "id"
    }
  ]
}
```

##### liteql.user_type (Trait Type)

```json
{
  "trait": true,
  "fields": [
    {
      "name": "name",
      "type": "string",
      "length": 255
    },
    {
      "name": "username",
      "type": "string",
      "length": 255
    },
    {
      "name": "email",
      "type": "string",
      "length": 255
    },
    {
      "name": "phone",
      "type": "string",
      "length": 255
    },
    {
      "name": "avatarUrl",
      "type": "string",
      "length": 255
    },
    {
      "name": "enabled",
      "type": "boolean",
      "nullable": false
    }
  ],
  "traits": [
    "liteql.domain_type"
  ]
}
```

#### Domain Type Definition

##### liteql_test.country (Domain Type)

```json
{
  "fields": [
    {
      "name": "id",
      "type": "id"
    },
    {
      "name": "name",
      "type": "string",
      "length": 255,
      "nullable": false
    },
    {
      "name": "code",
      "type": "string",
      "length": 255,
      "nullable": false
    },
    {
      "name": "users",
      "type": "reference",
      "domainTypeName": "liteql_test.user",
      "collection": true
    }
  ],
  "uniques": [
    {
      "fields": [
        "code"
      ]
    }
  ],
  "indexes": [
    {
      "fields": [
        "name"
      ]
    }
  ],
  "traits": [
    "liteql.domain_type"
  ]
}
```

##### liteql_test.user (Domain Type)

```json
{
  "fields": [
    {
      "name": "id",
      "type": "id"
    },
    {
      "name": "username",
      "type": "string",
      "nullable": false,
      "length": 255
    },
    {
      "name": "name",
      "type": "string",
      "nullable": false,
      "length": 255
    },
    {
      "name": "age",
      "type": "integer"
    },
    {
      "name": "email",
      "type": "string",
      "length": 255
    },
    {
      "name": "phone",
      "type": "string",
      "length": 255
    },
    {
      "name": "avatarUrl",
      "type": "string",
      "length": 255
    },
    {
      "name": "organization",
      "type": "reference",
      "domainTypeName": "liteql_test.organization"
    },
    {
      "name": "organizations",
      "type": "reference",
      "domainTypeName": "liteql_test.organization",
      "mappedDomainTypeName": "liteql_test.user_organization",
      "collection": true
    },
    {
      "name": "country",
      "type": "reference",
      "domainTypeName": "liteql_test.country"
    },
    {
      "name": "enabled",
      "type": "boolean"
    },
    {
      "name": "deleted",
      "type": "boolean"
    },
    {
      "name": "deletable",
      "type": "boolean"
    },
    {
      "name": "inherent",
      "type": "boolean"
    },
    {
      "name": "creatorId",
      "type": "string",
      "length": 255
    },
    {
      "name": "creatorName",
      "type": "string",
      "length": 255
    },
    {
      "name": "createTime",
      "type": "timestamp"
    },
    {
      "name": "lastModifierId",
      "type": "string",
      "length": 255
    },
    {
      "name": "lastModifierName",
      "type": "string",
      "length": 255
    },
    {
      "name": "lastModifiedTime",
      "type": "timestamp"
    }
  ],
  "uniques": [
    {
      "fields": [
        "username"
      ]
    }
  ],
  "indexes": [
    {
      "fields": [
        "email"
      ]
    }
  ],
  "traits": [
    "liteql.audit_type",
    "liteql.user_type"
  ]
}
```

### Query Definition

#### Read Query Definition

```json
{
  "queryType": "read",
  "domainTypeName": "liteql_test.user",
  "joins": [
    {
      "domainTypeName": "liteql_test.organization",
      "fields": {
        "name": "organizationName",
        "code": "organizationCode"
      },
      "conditions": [
        {
          "field": "code",
          "condition": "starts_with",
          "value": "F"
        }
      ],
      "joins": [
        {
          "domainTypeName": "liteql_test.country",
          "fields": {
            "name": "countryName",
            "code": "countryCode"
          }
        }
      ]
    }
  ]
}
```

#### Create Query Definition

```json
{
  "queryType": "create",
  "domainTypeName": "liteql_test.user",
  "data": {
    "name": "Carr Chang",
    "username": "carrchang"
  }
}
```

#### Update Query Definition

```json
{
  "queryType": "update",
  "domainTypeName": "liteql_test.user",
  "data": {
    "email": "carr@example.com",
    "username": "carrchang"
  }
}
```

#### Delete Query Definition

```json
{
  "domainTypeName": "liteql_test.user",
  "conditions": [
    {
      "field": "name",
      "condition": "contains",
      "value": "s"
    }
  ]
}
```

#### Batch Query Definition

```json
{
  "init_system": [
    {
      "queryType": "create",
      "domainTypeName": "liteql_test.country",
      "data": {
        "name": "United States",
        "code": "usa"
      }
    },
    {
      "queryType": "create",
      "domainTypeName": "liteql_test.organization",
      "data": {
        "name": "test",
        "code": "test",
        "country": {
          "code": "cn"
        },
        "parentId": "ROOT",
        "priority": 0,
        "sortCode": "1001",
        "leaf": true
      }
    },
    {
      "queryType": "create",
      "domainTypeName": "liteql_test.user",
      "data": {
        "name": "Administrator",
        "username": "admin"
      }
    }
  ],
  "users": {
    "queryType": "read",
    "domainTypeName": "liteql_test.user",
    "joins": [
      {
        "domainTypeName": "liteql_test.organization",
        "fields": {
          "name": "organizationName",
          "code": "organizationCode"
        }
      },
      {
        "domainTypeName": "liteql_test.country",
        "fields": {
          "name": "countryName",
          "code": "countryCode"
        }
      }
    ]
  }
}
```
