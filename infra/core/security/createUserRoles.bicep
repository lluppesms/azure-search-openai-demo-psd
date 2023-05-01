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
param resourceGroupName string
param openAiResourceGroupName string = ''
param formRecognizerResourceGroupName string = ''
param searchServiceResourceGroupName string = ''
param storageResourceGroupName string = ''

var roleDefinitions = loadJsonContent('roleDefinitions.json')

resource openAiResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(openAiResourceGroupName)) {
  name: !empty(openAiResourceGroupName) ? openAiResourceGroupName : resourceGroupName
}

resource formRecognizerResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(formRecognizerResourceGroupName)) {
  name: !empty(formRecognizerResourceGroupName) ? formRecognizerResourceGroupName : resourceGroupName
}

resource searchServiceResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(searchServiceResourceGroupName)) {
  name: !empty(searchServiceResourceGroupName) ? searchServiceResourceGroupName : resourceGroupName
}

resource storageResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = if (!empty(storageResourceGroupName)) {
  name: !empty(storageResourceGroupName) ? storageResourceGroupName : resourceGroupName
}

resource openAIRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.OpenAIUser)
}
resource openAIRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(openAIRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.OpenAIUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.OpenAIUser)
  }
}

resource formRecognizerRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.FormsRecognizerUser)
}
resource formRecognizerRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(formRecognizerRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.FormsRecognizerUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.FormsRecognizerUser)
  }
}

resource storageUserRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.StorageUser)
}
resource storageUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(storageUserRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.StorageUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.StorageUser)
  }
}
resource storageContributorRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.StorageContributor)
}
resource storageContributorRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(storageContributorRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.StorageContributor)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.StorageContributor)
  }
}

resource searchUserRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.SearchUser)
}
resource searchUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(searchUserRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.SearchUser)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.SearchUser)
  }
}

resource searchContributorRoleExists 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  name: guid(subscription().id, principalId, roleDefinitions.SearchContributor)
}
resource searchContributorRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (empty(searchContributorRoleExists.name)) {
  name: guid(subscription().id, principalId, roleDefinitions.SearchContributor)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitions.SearchContributor)
  }
}
