targetScope = 'subscription'

param principalId string
@allowed([
  'Device'
  'ForeignGroup'
  'Group'
  'ServicePrincipal'
  'User'
])
param principalType string = 'User'
// param resourceToken string
// param resourceGroupName string
// param openAiResourceGroupName string = ''
// param formRecognizerResourceGroupName string = ''
// param searchServiceResourceGroupName string = ''
// param storageResourceGroupName string = ''

var roleDefinitions = loadJsonContent('roleDefinitions.json')

// resource openAiResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(openAiResourceGroupName)) {
//   name: !empty(openAiResourceGroupName) ? openAiResourceGroupName : resourceGroupName
// }

// resource formRecognizerResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(formRecognizerResourceGroupName)) {
//   name: !empty(formRecognizerResourceGroupName) ? formRecognizerResourceGroupName : resourceGroupName
// }

// resource searchServiceResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(searchServiceResourceGroupName)) {
//   name: !empty(searchServiceResourceGroupName) ? searchServiceResourceGroupName : resourceGroupName
// }

// resource storageResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(storageResourceGroupName)) {
//   name: !empty(storageResourceGroupName) ? storageResourceGroupName : resourceGroupName
// }

resource openAIRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.OpenAIUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.OpenAIUser)
  }
}

resource formRecognizerRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.FormsRecognizerUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.FormsRecognizerUser)
  }
}

resource storageUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.StorageUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.StorageUser)
  }
}

resource storageContributorRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.StorageContributor)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.StorageContributor)
  }
}

resource searchUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.SearchUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.SearchUser)
  }
}

resource searchContributorRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().id, principalId, roleDefinitions.SearchContributor)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.SearchContributor)
  }
}
