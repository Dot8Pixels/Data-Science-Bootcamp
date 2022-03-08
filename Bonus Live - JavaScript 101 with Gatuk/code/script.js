let currentMood = ""
let moods = []
/*let moods = [
    {
        moodName: 'neutral',
        description: 'nhkuh'
    },
    {
        moodName: 'good',
        description: 'nhkuh'
    }
]*/

function onMoodClicked(mood){
    currentMood = mood
    console.log('Mood', mood)
}

function onSubmit(){
    // Get selected mood

    // Get description value
    const descriptionBox = document.getElementById('description-input-box')
    const descriptionValue = descriptionBox.value

    // Update mood list
    const newMood = {
        moodName: currentMood,
        description: descriptionValue
    }
    moods = moods.concat([newMood])
    
    // Render mood list
    const moodList = document.getElementById('mood-list')
    moods.map(function(mood){
        let cell = document.createElement('div')
        cell.style.display = 'inline-block'
        cell.style.width = '20px'
        cell.style.height = '20px'
        cell.style.backgroundColor = getBackgroundColor(mood.moodName)
        moodList.appendChild(cell)
    })

}

function getBackgroundColor(mood){
    if (mood === 'good'){
        return 'green'
    }
    else if (mood === 'neutral'){
        return 'orange'
    }
    else {
        return 'red'
    }
}