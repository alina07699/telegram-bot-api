func start(botToken string) {
	var err error
	bot, err = api.NewBotAPI(5198875070:AAHpF1gq5YTnQaMTk3chIKJGLyVSC1cSgPc)
	if err != nil {
		log.Panic(err)
	}
	bot.Debug = debug
	log.Printf("Authorized on account: %s  ID: %d", bot.Self.UserName, bot.Self.ID)
 
	u := api.NewUpdate(0)
	u.Timeout = 60
 
	updates, err := bot.GetUpdatesChan(u)
	if err != nil {
		panic("Can't get Updates")
	}
	for update := range updates {
		if update.Message == nil { // ignore any non-Message updates
			continue
		}
		go processUpdate(&update)
	}
}
