import Foundation

public enum RefdsRandomText: CaseIterable {
    case fantasyWorlds
    case spaceExploration
    case cyberpunkDystopia
    case enchantedForest
    case steampunkAdventure
    
    public var word: String {
        let words = words
        let index = Int.random(in: 0 ..< words.count)
        return words[index]
    }
    
    public var paragraph: String {
        let paragraphs = paragraphs
        let index = Int.random(in: 0 ..< paragraphs.count)
        return paragraphs[index]
    }
    
    var words: [String] {
        switch self {
        case .fantasyWorlds:
            return ["Dragon", "Wizard", "Elf", "Potion", "Castle", "Enchantment", "Quest", "Magical", "Forest", "Mystical", "Adventure", "Sorcerer", "Fairy", "Mythical", "Legendary"]
        case .spaceExploration:
            return ["Galaxy", "Nebula", "Starship", "Astronaut", "Exoplanet", "Warp Drive", "Alien", "Cosmos", "Universe", "Interstellar", "Extraterrestrial", "Exploration", "Cosmic", "Constellation", "Spacecraft"]
        case .cyberpunkDystopia:
            return ["Cybernetics", "Megacorporation", "Hacker", "Augmentation", "Neon", "Dystopia", "Surveillance", "Artificial Intelligence", "Rebellion", "Virtual Reality", "Implant", "Corporate", "Hacktivist", "Nanotechnology", "Data"]
        case .enchantedForest:
            return ["Faerie", "Pixie", "Gnome", "Unicorn", "Enchanted", "Moss", "Whisper", "Nymph", "Fairy Ring", "Druid", "Sylvan", "Magic", "Ethereal", "Mythical", "Spirit"]
        case .steampunkAdventure:
            return ["Airship", "Goggles", "Automaton", "Steam", "Clockwork", "Adventure", "Invention", "Brass", "Cog", "Victorian", "Industrial", "Contraption", "Mechanism", "Zeppelin", "Pilot"]
        }
    }
    
    var paragraphs: [String] {
        switch self {
        case .fantasyWorlds:
            return [
                "In the ancient castle, a wise wizard brewed potions of unimaginable power, hidden away from the world.",
                "Amidst the mystical forest, an elven archer silently watched over the enchanted glade, protecting it from harm.",
                "The brave knight embarked on a quest to slay the fearsome dragon and restore peace to the kingdom.",
                "Legends spoke of a sorcerer who could wield the forces of nature with a mere whisper, shaping reality itself.",
                "Far beyond the horizon, a mythical land awaited discovery, filled with wonders beyond imagination."
            ]
        case .spaceExploration:
            return [
                "In the vast expanse of the cosmos, starships navigated through nebulae, seeking out new worlds and civilizations.",
                "Astronauts ventured into the unknown, their eyes filled with wonder as they gazed upon distant galaxies never before seen by human eyes.",
                "Among the stars, an alien civilization thrived, their technology far surpassing anything humanity had ever dreamed of.",
                "Explorers braved the dangers of interstellar travel, driven by the promise of discovery and the quest for knowledge.",
                "In the depths of space, a lone spacecraft drifted silently, its crew unaware of the cosmic mysteries awaiting them."
            ]
        case .cyberpunkDystopia:
            return [
                "In the neon-lit streets of the megacity, hackers waged a constant battle against corporate surveillance, fighting for freedom in a world ruled by machines.",
                "Implants and cybernetic enhancements were commonplace, blurring the line between man and machine, while megacorporations vied for control of the digital realm.",
                "In the virtual world of the net, hacktivists exposed the secrets of the powerful, revealing the truth behind their facade of control.",
                "Amidst the chaos of the dystopian cityscape, a rebellion simmered, fueled by the hope of overthrowing the oppressive regime and restoring humanity's lost freedoms.",
                "As the boundaries between reality and virtual reality blurred, society teetered on the brink of collapse, caught in a web of deception and deceit."
            ]
        case .enchantedForest:
            return [
                "In the heart of the enchanted forest, a faerie danced beneath the moonlight, her laughter echoing through the ancient trees.",
                "Hidden within the moss-covered glade, a pixie fluttered its delicate wings, casting a spell of enchantment over all who dared to enter.",
                "Among the whispering leaves, a gnome tended to his garden, cultivating plants with magical properties known only to those who dwelled within the sylvan realm.",
                "At the edge of the forest, a unicorn grazed peacefully, its horn shimmering with ethereal light, a symbol of purity and grace.",
                "In the depths of the woods, a nymph sang a haunting melody, her voice carrying across the wind, beckoning travelers to discover the secrets hidden within."
            ]
        case .steampunkAdventure:
            return [
                "High above the city skyline, an airship soared through the clouds, its brass hull gleaming in the sunlight as it embarked on a daring expedition.",
                "Through the thick goggles of her aviator helmet, the intrepid pilot surveyed the landscape below, navigating through the maze of gears and steam-powered machinery.",
                "In the heart of the industrial district, a mad inventor toiled away in his workshop, creating fantastical contraptions powered by the magic of steam.",
                "Amidst the hustle and bustle of the Victorian streets, adventurers gathered, their minds filled with dreams of exploration and discovery.",
                "As the clockwork gears turned and the steam engines roared to life, the world braced itself for a new era of invention and adventure."
            ]
        }
    }
}
